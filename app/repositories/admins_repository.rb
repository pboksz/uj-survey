class AdminsRepository < DefaultRepository
  def find_by_email(email)
    klass.where(email: email).first
  end

  def update_login_information(id)
    find(id).touch(:last_sign_in_at)
    klass.increment_counter(:sign_in_count, id)
  end
end
