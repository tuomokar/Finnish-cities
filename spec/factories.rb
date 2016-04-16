FactoryGirl.define do
  factory :region_en, class: Region do
    I18n.locale = :en
    name "Southwest Finland"
    area 1000.0
    population 15000
    description "Southwest Finland's capital is Turku"
  end

  factory :region_fi, class: Region do
    I18n.locale = :fi
    name "Pohjois-Karjala"
    area 500.0
    population 20000
    description "Pohjois-Karjala is the northern part of the area of Karjala"
  end

  factory :municipality_en, class: Municipality do
    I18n.locale = :en
    name "Helsinki"
    population 100000
  end

  factory :user, class: User do
    I18n.locale =:en
    username "user1"
    password "passwordA1"
    password_confirmation "passwordA1"
  end
end