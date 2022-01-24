# frozen_string_literal: true

require_relative '../spec_helper'
require 'program'

describe 'Program' do
  subject { Program.run(input_path) }
  let(:expected_output) { File.read(output_path) }

  describe 'input1' do
    let(:input_path) { File.expand_path("#{__dir__}/../fixtures/input1.csv") }
    let(:output_path) { File.expand_path("#{__dir__}/../fixtures/output1.txt") }

    it { expect { subject }.to output(expected_output).to_stdout }
  end

  describe 'input2' do
    let(:input_path) { File.expand_path("#{__dir__}/../fixtures/input2.csv") }
    let(:output_path) { File.expand_path("#{__dir__}/../fixtures/output2.txt") }

    it { expect { subject }.to output(expected_output).to_stdout }
  end

  describe 'input3' do
    let(:input_path) { File.expand_path("#{__dir__}/../fixtures/input3.csv") }
    let(:output_path) { File.expand_path("#{__dir__}/../fixtures/output3.txt") }

    it { expect { subject }.to output(expected_output).to_stdout }
  end
end
