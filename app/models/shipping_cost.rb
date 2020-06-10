class ShippingCost < ActiveHash::Base
  self.data = [
    {id: "", cost: "選択してください", sub_cost: "選択してください"},
    {id: 1, cost: "送料込み(出品者負担)", sub_cost: "送料込み"},
    {id: 2, cost: "着払い(購入者負担)", sub_cost: "着払い"}
  ]
end