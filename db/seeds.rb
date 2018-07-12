# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

property_types = ["Appartement", "Maison", "Bureau", "Boutique", "Villa", "Chambre", "Magasin", "Terrain", "Parcelle", "Immeuble"].sort
property_types.each do |property_type|
    PropertyType.create name: property_type
end

ad_types = ["À louer", "À vendre"].sort
ad_types.each do |ad_type|
    AdType.create name: ad_type
end

cities = "Banikoara Gogounou Kandi Karimama Malanville Segbana Boukoumbé Cobly Kérou Kouandé Matéri Natitingou Pehonko Tanguiéta Toucountouna Abomey-Calavi Allada Kpomassè Ouidah Sô-Ava Toffo Tori-Bossito Zè Bembéréké Kalalé N'Dali Nikki Parakou Pèrèrè Sinendé Tchaourou Bantè Dassa-Zoumè Glazoué Ouèssè Savalou Savè Aplahoué Djakotomey Dogbo Klouékanmè Lalo Toviklin Bassila Copargo Djougou Ouaké Cotonou Athiémé Bopa Comè Grand-Popo Houéyogbé Lokossa Adjarra Adjohoun Aguégués Akpro-Missérété Avrankou Bonou Dangbo Porto-Novo Sèmè-Kpodji Ifangni Adja-Ouèrè Kétou Pobè Sakété Abomey Agbangnizoun Bohicon Covè Djidja Ouinhi Za-Kpota Zagnanado Zogbodomey".split.sort
cities.each do |city|
    City.create name: city
end

# room = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces", "plus de 5 pièces"].sort
# room.each do |i|
#     Room.create name: i
# end
