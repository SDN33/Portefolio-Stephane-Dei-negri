# db/seeds.rb
include ActionView::Helpers::UrlHelper

# Supprime toutes les offres et projects existantes pour éviter les doublons
Offer.delete_all
Project.delete_all

# Crée les nouvelles offres
offers = [
  { title: "Logo Pro", price_cents: 9900, duration: 7, description: "Création sur-mesure d'un logo captivant. Idéal pour startups/freelancers et particuliers. Boostez votre identité visuelle !", image_url: "https://res.cloudinary.com/daroyxenr/video/upload/c_scale,q_auto:best,w_209/v1712502338/3_wwki6z.mp4" },
  { title: "Site Portfolio", duration: 14, price_cents: 49900, description: "Développement d'un site portfolio personnalisé. Responsive, SEO-friendly. Idéal pour les professionnels désirant valoriser leur activité.", image_url: "https://res.cloudinary.com/daroyxenr/video/upload/c_scale,q_auto:best,w_209/v1712502339/1_wz0qwu.mp4" },
  { title: "Web App", duration: 0, price_cents: 0, description: "Création complète de Web App sur-mesure. Sécurité et performance. Solution idéale pour entreprises voulant innover et se démarquer.", image_url: "https://res.cloudinary.com/daroyxenr/video/upload/c_scale,q_auto:best,w_209/v1712502340/2_stoq6v.mp4" },
]

# Insère les offres dans la base de données
offers.each do |offer|
  Offer.create!(offer)
end

# Crée les nouveaux projets
projects = [
  {
    title: "Players",
    category: "Web App",
    description: "Players est une application mobile en react.js, qui permet aux passionnés de sports (football⚽, basket🏀, sports de raquette🎾), Players permet de trouver des adversaires près de chez vous pour organiser et/ou rejoindre des matchs inoubliables. Des fonctionnalités innovantes vous aideront à vous surpasser ! #{link_to 'Cliquez ici', 'https://players-pearl.vercel.app/', target: '_blank'}",
    image_url: "https://res.cloudinary.com/daroyxenr/video/upload/v1716449950/Fauget_S45_Pro_phale5.mp4"
  },
  {
    title: "ChargeMates",
    category: "Web App",
    description: "Projet de fin de formation Le Wagon Bordeaux, ChargeMates est une plateforme de mise en relation entre particulier pour pouvoir recharger son véhicule électrique à moindre coût et/ou louer sa borne de recharge électrique ainsi que son stationnement.",
    image_url: "https://res.cloudinary.com/daroyxenr/video/upload/v1712501795/2_wvuofe.mp4"
  },
  {
    title: "Podcast Super-Humains",
    category: "Logo Pro",
    description: "Super Humains est un podcast qui présente des sportifs de haut niveau aux parcours semés d’embûches, d’épreuves, de désillusions et parfois même de drames. Écrit et produit par l’ailière de Lattes-Montpellier Diandra Tchatchouang, ce 1er podcast créé par une sportive française en activité a pour but d’inspirer en mettant en lumière des hommes et des femmes qui ont su faire des difficultés de vie une force.",
    image_url: "https://res.cloudinary.com/daroyxenr/video/upload/v1712501796/1_vpgnwe.mp4"
  },
]

# Insère les projets dans la base de données
projects.each do |project|
  description_with_link = project[:description]
  description_with_link += " #{link_to 'Cliquez ici', project[:link], target: '_blank'}" if project[:link]
  Project.create!(
    title: project[:title],
    category: project[:category],
    description: description_with_link,
    image_url: project[:image_url]
  )
end
