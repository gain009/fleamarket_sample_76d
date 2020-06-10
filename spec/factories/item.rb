FactoryBot.define do
  factory :user do  #値は適当です
    nickname          {"sasa"}
    email             {"kkk@gmail.com"}
    password          {"00000000"}  #登録の際に必要なので追記！
    encrypted_password{"00000000"}
    family_name       {"sasaki"}
    first_name        {"goro"}
    family_name_kana  {"sasaki"}
    first_name_kana   {"goro"}
    birth_day         {"1990-08-24"}
  end

  factory :category do  
    name              {"aaa"}
  end

  factory :brand do  
    name              {"aaa"}
  end

  factory :item do 
    id                       {"1"}
    name                     {"商品名"}
    description              {"詳細"}
    status_id                {"1"}
    prefecture_id            {"1"}
    shipping_date_id         {"1"}
    price                    {"1000"}
    size_id                  {"1"}
    shipping_method_id       {"1"}
    shipping_cost_id         {"1"}
    user_id                  {"1"}
    category_id              {"1"}
    brand_id                 {"1"}
    after(:build) do |item|
      item.images << build(:image, item: item) 
    end   
  end
end