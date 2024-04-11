class OffersController < ApplicationController
  # Appelle set_offer avant les actions spécifiées, ici uniquement :show pour l'instant.
  # Ajoutez d'autres actions comme :edit, :update, :destroy si vous avez ces vues et souhaitez sécuriser l'accès à une offre spécifique.
  before_action :set_offer, only: [:show]

  def index
    # Récupère toutes les offres et tous les projets pour les afficher sur la page index
    @offers = Offer.all
    @projects = Project.all
  end

  def show
    # L'offre spécifique @offer est déjà définie grâce à set_offer appelé par before_action
    # Aucun code supplémentaire n'est nécessaire ici si la vue show utilise simplement @offer
    # Dans votre contrôleur Rails, par exemple dans OffersController#show
    @client_token = Braintree::ClientToken.generate

  end

  private

  # Définit @offer en utilisant l'ID fourni dans les paramètres de la requête
  def set_offer
    @offer = Offer.find(params[:id])
  end

  def generate_client_token
    # pass client_token to your front-end
    @client_token = gateway.client_token.generate(
      :customer_id => a_customer_id
    )
  end
end
