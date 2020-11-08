FactoryBot.define do
  factory :order_address do
    zip { "490-1113" }
    prefecture_id { 2 }
    city { "あま市" }
    block { "5" }
    building { "コーポ" }
    phone_number { "09012345678" }  
    token {"tok_abcdrde0000000000000000"}
  end
end
