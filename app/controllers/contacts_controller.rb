# app/controllers/contacts_controller.rb

class ContactsController < ApplicationController
  def create
    # Récupérer les données du formulaire
    name = params[:name]
    email = params[:_replyto]
    message = params[:message]

    # Valider l'e-mail
    if valid_email?(email)
      # Le reste de votre logique pour traiter le formulaire
      # ...
      # ...

      # Par exemple, vous pouvez afficher un message de succès
      flash[:notice] = "Votre message a été envoyé avec succès !"
    else
      # En cas d'e-mail invalide, afficher un message d'erreur
      flash[:alert] = "Veuillez entrer une adresse e-mail valide."
    end

    # Rediriger vers une page appropriée
    redirect_to root_path
  end

  private

  def valid_email?(email)
    # Utilisez une expression régulière pour valider l'e-mail
    # Cette expression est plus simple que celle utilisée dans le HTML
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email =~ email_regex
  end
end
