require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        v = Vote.new(value: 1)
        expect(v).to be_valid
        
        v2 = Vote.new(value: 2)
        expect(v2).not_to be_valid
        
        v3 = Vote.new(value: -1)
        expect(v3).to be_valid
      end
    end
  end
end