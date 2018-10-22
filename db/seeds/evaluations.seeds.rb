file = Psych.load_file(“db/seeds/evaluations.yml”)
file[“evaluations”].each do |params|
  Evaluation.find_or_create_by(params)
end