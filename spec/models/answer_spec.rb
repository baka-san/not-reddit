require 'rails_helper'

RSpec.describe Answer, type: :model do

	let(:question) { Question.create!(title: "New question title", body: "New question body", resolved: false) }
	let(:answer) { Answer.create!(body: "New answer body", question: question) }

	describe "attributes" do

		it "has a body and associated quesiton" do
			expect(answer).to have_attributes(body: "New answer body", question: question)
		end
	end
end
