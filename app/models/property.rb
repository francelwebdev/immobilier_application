class Property < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  #ADTYPE = ["Location", "Vente"]
  #PROPERTYTYPE = ["Maison", "Appartement", "Boutique", "Villa"]
  ROOM = ["1 pièce", "2 pièces", "3 pièces", "4 pièces", "5 pièces", "plus de 5 pièces"]

  belongs_to :user
  belongs_to :ad_type
  belongs_to :property_type

  has_many :property_photos, dependent: :destroy

  validates :title, :ad_type_id, :property_type_id, :price, :area, :description, :city, :address, :room, presence: true
  validates :title, uniqueness: {message: "Une autre annonce porte déja le titre qque vous avez renseigné"}
  validates :price, presence: {message: "Le prix doit être renseigné !"}
  validates :area, presence: {message: "La surface du bien doit être renseigné !"}
  validates :address, presence: {message: "L'adresse du bien doit être renseigné !"}
  validates :city, presence: {message: "La ville dans laquel se trouve le bien doit être renseigné !"}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  accepts_nested_attributes_for :property_photos, allow_destroy: true
end
