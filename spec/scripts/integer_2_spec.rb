require "date"

describe "odd.rb" do
  it "should output 'false' if the entered number is not odd", points: 1 do
    # Un-require odd.rb
    odd = $".select{|r| r.include? 'odd.rb'}
    $".delete(odd.first)
    
    allow_any_instance_of(Object).to receive(:gets).and_return("12")

    output = with_captured_stdout { require_relative('../../odd')} 
    output = "empty" if output.empty? 
    expect(output.match?(/false/i)).to be(true),
      "Expected output to be 'Enter an odd number:\\nfalse', but was #{output}."

  end
end

describe "birth_year.rb" do
  it "should output 'Wow, you were born in #{Date.today.year - 80}. You're old!' if the input is 80.", points: 1 do

    allow_any_instance_of(Object).to receive(:gets).and_return("80")
    year = Date.today.year - 80

    output = with_captured_stdout { require_relative('../../birth_year')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Wow, you were born in #{year}. You're old!/i)).to be(true),
      "Expected output to be 'How old are you?\\nWow, you were born in #{year}. You're old!', but was #{output}."

  end
end

describe "birth_year.rb" do
  it "should output 'Wow, you were born in #{Date.today.year - 20}. You're old!' if the input is 20.", points: 1 do
    # Un-require birth_year.rb
    birth_year = $".select{|r| r.include? 'birth_year.rb'}
    $".delete(birth_year.first)

    allow_any_instance_of(Object).to receive(:gets).and_return("20")
    year = Date.today.year - 20

    output = with_captured_stdout { require_relative('../../birth_year')} 
    output = "empty" if output.empty? 
    expect(output.match?(/Wow, you were born in #{year}. You're old!/i)).to be(true),
      "Expected output to be 'How old are you?\\nWow, you were born in #{year}. You're old!', but was #{output}."

  end
end

def with_captured_stdout
  original_stdout = $stdout  # capture previous value of $stdout
  $stdout = StringIO.new     # assign a string buffer to $stdout
  yield                      # perform the body of the user code
  $stdout.string             # return the contents of the string buffer
ensure
  $stdout = original_stdout  # restore $stdout to its previous value
end
