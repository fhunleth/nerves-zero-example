#!/usr/bin/env elixir

defmodule Uploader do

  def upload(fwfile, port, passphrase) do
    stats = File.stat!(fwfile)
    fwsize = stats.size

    :ssh.start()
    {:ok, connection_ref} = :ssh.connect('nerves.local', port, [rsa_pass_phrase: passphrase, silently_accept_hosts: true])
    {:ok, channel_id} = :ssh_connection.session_channel(connection_ref, :infinity)
    :success = :ssh_connection.subsystem(connection_ref, channel_id, 'nerves_firmware_ssh', :infinity)
    :ok = :ssh_connection.send(connection_ref, channel_id, "fwup:#{fwsize},reboot\n")

    chunks =
      File.open!(fwfile, [:read])
      |> IO.binstream(16384)

    wait_for_complete(connection_ref, channel_id, chunks)
  end

  def wait_for_complete(connection_ref, channel_id, chunks) do
    timeout =
      case Enum.take(chunks, 1) do
        [chunk] ->
          :ok = :ssh_connection.send(connection_ref, channel_id, chunk)
          0
        [] ->
          10_000
      end

    receive do
      {:ssh_cm, _connection_ref, {:data, 0, 0, message}} ->
        IO.write(message)
        IO.write("")
        wait_for_complete(connection_ref, channel_id, chunks)
      {:ssh_cm, _connection_ref, {:eof, 0}} ->
        # Ignore.
        wait_for_complete(connection_ref, channel_id, chunks)
      {:ssh_cm, _connection_ref, {:closed, 0}} ->
        :ok
    after
      timeout ->
        wait_for_complete(connection_ref, channel_id, chunks)
    end
  end
end


key_passphrase='secret'
Uploader.upload("./_build/rpi0/dev/nerves/images/zero.fw", 8989, key_passphrase)
