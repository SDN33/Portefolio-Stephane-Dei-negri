
class ScrollAnimatorController < ApplicationController
  def index
    # Récupérer des données à partir de la base de données
    offers = Offer.all

    # Répondre avec les données au format JSON
    render json: offers
  end
end
