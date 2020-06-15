FactoryBot.define do
  
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