Contact.destroy_all
Company.destroy_all
Comment.destroy_all
Job.destroy_all
Category.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
cool = Category.create(title: "Cool")
fun = Category.create(title: "Fun")
fulfilling = Category.create(title: "Fulfilling")
ebpw = Category.create(title: "Evil But Pays Well")
status = Category.create(title: "Statusful")
stigma = Category.create(title: "Stigmatized")
CATEGORIES = [cool, fun, fulfilling, ebpw, status, stigma]


COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category_id: CATEGORIES.sample.id)
    puts "Created #{company.jobs[num].title}"
  end
end
