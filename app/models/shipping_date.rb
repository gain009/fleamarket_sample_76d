class ShippingDate < ActiveHash::Base
  self.data = [
    {id: "", date: "選択してください"},
    {id: 1, date: "1~2日で発送"},
    {id: 2, date: "2~3日で発送"},
    {id: 3, date: "4~7日で発送"},
  ]
end