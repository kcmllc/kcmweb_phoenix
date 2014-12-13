use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :phoenix, KcmwebPhoenix.Router,
  url: [host: "example.com"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "RpG9abYJ0NJao2U4PIX8tBnkFmkrgnLq1/0aHvZSPxQwfda1gIK7W/sl4wAx/YEpwKwp3PERB6zIm+w2ukWXdA=="

config :logger, :console,
  level: :info
