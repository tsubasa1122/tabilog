
# coding: utf-8

Category.create(:category_name => '泊まる')
Category.create(:category_name => '遊ぶ')
Category.create(:category_name => '食べる')
Category.create(:category_name => '買い物')
Category.create(:category_name => '自然・名所')

Evaluation.create(:evaluation_name => '快適さ', :evaluation_numeric_number =>1)
Evaluation.create(:evaluation_name => '賑わい', :evaluation_numeric_number =>2)
Evaluation.create(:evaluation_name => '落ち着き', :evaluation_numeric_number =>3)
Evaluation.create(:evaluation_name => 'おしゃれ', :evaluation_numeric_number =>4)
Evaluation.create(:evaluation_name => 'ロマンチック', :evaluation_numeric_number =>5)

