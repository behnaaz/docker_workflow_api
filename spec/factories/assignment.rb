FactoryGirl.define do
  factory :assignment do
    question { Faker::Lorem.sentence(1) }
    answer { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    feedback_positive  'hier goed feedback'
    feedback_negative  'hier fout feedback'
    placeholder_answer 'bla_xxxx.jpg'
    points 100
    kind :digital
  end
end