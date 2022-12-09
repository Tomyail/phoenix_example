defmodule Auction.Password do
  import Pbkdf2 

  def hash(password) do
    IO.puts(hash_pwd_salt(password))
    hash_pwd_salt(password)
  end

  def verify_with_hash(password,hash), do:
    verify_pass(password,hash)

  def dummy_verify, do: no_user_verify()
end
