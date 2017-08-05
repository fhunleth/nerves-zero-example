# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :nerves_network,
  regulatory_domain: "US"

#config :nerves, :firmware,
  #rootfs_additions: "rootfs-additions"

# Boot the bootloader first and have it start our app.
config :bootloader,
  init: [:nerves_init_gadget],
  app: :zero

config :nerves_firmware_ssh,
  authorized_keys: [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDBCdMwNo0xOE86il0DB2Tq4RCv07XvnV7W1uQBlOOE0ZZVjxmTIOiu8XcSLy0mHj11qX5pQH3Th6Jmyqdjo9WCjf3H/VaAxKtxp0bkL5uAf4tn0W3oU5KmuBoxmkYhcBbs6VG4lgBCsGH9ZnMJ+4JuWtC5s6krzwUgd3pL8JHuMw== fhunleth",
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCaf37TM8GfNKcoDjoewa6021zln4GvmOiXqW6SRpF61uNWZXurPte1u8frrJX1P/hGxCL7YN3cV6eZqRiFJKxo4VBRQE4OnWEY6e0+2tN1cwd6FGdBmCndf6GBEm/s6sf0psjcB6tMordrCIzWiZ8fNTCohJihfdgroyhl52c2K1Nkp0FF16+Y0nmv5fobe0r03wTe/oanejF0M3QcCZ5QBEvHK7+CUMhgRhNh5IkcP8lIrwLlHr8p2nFGWhkR6EvYDdYCNCcNruV3dmhQ2/c2zrbuFTqZfdIDlD+jP02YdyPIszkaeRbgPQckxyGOso3Mq0F5ay2OiE0ntYgUolO31FMORfVPgWHf2xKpGp40f3G8FRRvc7xrHGQvr/0KWue6YFrtDPhPhzM9+8EZ7ueMj6eG3ImWXn+GHdsp8v8rc/cCtZ+T8k8Xv2MA+T0CZz4IuPSMB3uVaCmHMSOGdscTsnuOZZLvQ+V17rk+XuvDXVyYMk+J3WRtw/Kr5eI6sFW1G+TKdrE2MbRNuQZBJq0mMzVQfAVYburC1fYBRppcv5SopD/2zeiIXtG+ZPZfYAhbpSU6rAST1oicMnpUKqxCm7u6Zt/790qYLOje+OyxKf6C3fWbQuUU/bu+gzVdyKyYII1EQhkeKrTV2/Q6hIovdMkGLLi+PWWh+YWAna5o8w== fhunleth"
  ]

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"

