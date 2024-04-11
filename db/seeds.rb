

# Supprime toutes les offres et projects existantes pour éviter les doublons
Offer.delete_all
Project.delete_all

# Crée les nouvelles offres
offers = [
  { title: "Logo Pro", price_cents: 9900, description: "Création sur-mesure d'un logo captivant. Idéal pour startups/freelancers et particuliers. Boostez votre identité visuelle !", image_url: "https://res.cloudinary.com/daroyxenr/video/upload/c_scale,q_auto:best,w_209/v1712502338/3_wwki6z.mp4" },
  { title: "Site Portfolio", price_cents: 49900, description: "Développement d'un site portfolio personnalisé. Responsive, SEO-friendly. Idéal pour les professionnels désirant valoriser leur activité.", image_url: "https://res.cloudinary.com/daroyxenr/video/upload/c_scale,q_auto:best,w_209/v1712502339/1_wz0qwu.mp4" },
  { title: "Web App", price_cents: 0, description: "Création complète de Web App sur-mesure. Sécurité et performance. Solution idéale pour entreprises voulant innover et se démarquer.", image_url: "https://res.cloudinary.com/daroyxenr/video/upload/c_scale,q_auto:best,w_209/v1712502340/2_stoq6v.mp4" },
]

# Insère les offres dans la base de données
offers.each do |offer|
  Offer.create!(offer)
end


Project.delete_all

projects = [
  { title: "ChargeMates", category:"Web App", description:"Projet de fin de formation Le Wagon Bordeaux, ChargeMates est une plateforme de mise en relation entre particulier pour pouvoir recharger son véhicule électrique à moindre coût et/ou louer sa borne de recharge électrique ainsi que son stationnement.", image_url:"https://res.cloudinary.com/daroyxenr/video/upload/v1712501795/2_wvuofe.mp4" },
  { title: "Podcast Super-Humains",category:"Logo Pro", description:"Super Humains est un podcast qui présente des sportifs de haut niveau aux parcours semés d’embûches, d’épreuves, de désillusions et parfois même de drames. Écrit et produit par l’ailière de Lattes-Montpellier Diandra Tchatchouang, ce 1er podcast créé par une sportive française en activité a pour but d’inspirer en mettant en lumière des hommes et des femmes qui ont su faire des difficultés de vie une force.", image_url:"https://res.cloudinary.com/daroyxenr/video/upload/v1712501796/1_vpgnwe.mp4" },
]

projects.each do |project|
  Project.create!(project)
end
