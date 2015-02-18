require 'spec_helper'

describe JsonFormFields do

  let!(:json_select){ {method: ["GET", "POST", "PUT", "DELETE"] }.to_json }
  let!(:input_select){
    "<div><select name=\"method\" id=\"method\">"\
      "<option value=\"GET\">GET</option>"\
      "<option value=\"POST\">POST</option>"\
      "<option value=\"PUT\">PUT</option>"\
      "<option value=\"DELETE\">DELETE</option>"\
    "</select></div>"
  }

  let!(:json_select_multiple){ {method: ["GET", "POST", "PUT", "DELETE", "_multiple"] }.to_json }
  let!(:input_select_multiple){
    "<div><select name=\"method\" multiple id=\"method\">"\
      "<option value=\"GET\">GET</option>"\
      "<option value=\"POST\">POST</option>"\
      "<option value=\"PUT\">PUT</option>"\
      "<option value=\"DELETE\">DELETE</option>"\
    "</select></div>"
  }

  let!(:json_radio){ { am_i: ['Women', 'Man', '_radio'] }.to_json }
  let!(:input_radio){
    "<div><input type=\"radio\" name=\"am_i\" value=\"Women\" />Women"\
    "<input type=\"radio\" name=\"am_i\" value=\"Man\" />Man</div>"\
  }

  let!(:json_checkboxes){ { so: ['Linux', 'Windows', '_checkbox'] }.to_json }
  let!(:input_checkboxes){
    "<div><input type=\"checkbox\" name=\"so\" value=\"Linux\" />Linux"\
    "<input type=\"checkbox\" name=\"so\" value=\"Windows\" />Windows</div>"\
  }

  let!(:json_checkboxes_group){ { so: ['Linux', 'Windows', '_checkbox', '_multiple'] }.to_json }
  let!(:input_checkboxes_group){
    "<div><input type=\"checkbox\" name=\"so[]\" value=\"Linux\" />Linux"\
    "<input type=\"checkbox\" name=\"so[]\" value=\"Windows\" />Windows</div>"\
  }

  let!(:json_password){ { password: "" }.to_json }
  let!(:input_password){ "<div><input name=\"password\" type=\"password\" id=\"password\" /></div>" }

  let!(:json_text){ { url: "http://" }.to_json }
  let!(:input_text){ "<div><input name=\"url\" type=\"text\" id=\"url\" value=\"http://\" /></div>" }

  let!(:json_email){ { email: "" }.to_json }
  let!(:input_email){ "<div><input name=\"email\" type=\"email\" id=\"email\" value=\"\" /></div>" }

  context "generates" do
    it "select" do
      expect(JsonFormFields::Generator.generate_inputs(json_select)).to eq(input_select)
    end

    it "password" do
      expect(JsonFormFields::Generator.generate_inputs(json_password)).to eq(input_password)
    end

    it "text" do
      expect(JsonFormFields::Generator.generate_inputs(json_text)).to eq(input_text)
    end

    it "email" do
      expect(JsonFormFields::Generator.generate_inputs(json_email)).to eq(input_email)
    end

    it "checkbox" do
      expect(JsonFormFields::Generator.generate_inputs(json_checkboxes)).to eq(input_checkboxes)
    end

    it "checkbox group" do
      expect(JsonFormFields::Generator.generate_inputs(json_checkboxes_group)).to eq(input_checkboxes_group)
    end

    it "multiple select" do
      expect(JsonFormFields::Generator.generate_inputs(json_select_multiple)).to eq(input_select_multiple)
    end

    it "radio" do
      expect(JsonFormFields::Generator.generate_inputs(json_radio)).to eq(input_radio)
    end

  end
end
