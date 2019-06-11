# frozen_string_literal: true

RSpec.describe Identikal do
  it 'has a version number' do
    expect(Identikal::VERSION).not_to be nil
  end

  it 'should throw exception if either files does not exist' do
    file_a = pdf_spec_file('sample_a')
    file_b = pdf_spec_file('non-existant-file')
    expect { Identikal.files_same?(file_a, file_b) }
      .to raise_error(Identikal::Error::FileNotFound)
  end

  it 'should throw exception if unsupported compare method provided' do
    file_a = pdf_spec_file('sample_a')
    file_b = pdf_spec_file('sample_b')
    expect { Identikal.files_same?(file_a, file_b, compare_method: :images) }
      .to raise_error(Identikal::Error::InvalidComparisonMethod)
  end

  context 'with formatting' do
    it 'should return true if the two PDFs are identical' do
      file_a = pdf_spec_file('sample_a')
      file_b = pdf_spec_file('sample_b')
      allow(Identikal::Compare).to receive(:format_compare).and_call_original
      expect(Identikal::Compare).to receive(:format_compare)
      result = Identikal.files_same?(file_a, file_b, compare_method: :all)
      expect(result).to eq(true)
    end

    it 'should immediately return false if page counts are different' do
      file_a = pdf_spec_file('sample_a')
      file_b = pdf_spec_file('sample_c_extra_page')
      allow(Identikal::Compare).to receive(:format_compare).and_call_original
      expect(Identikal::Compare).not_to receive(:format_compare)
      result = Identikal.files_same?(file_a, file_b)
      expect(result).to eq(false)
    end
  end

  context 'text only' do
    it 'should return true if the two PDFs are identical' do
      file_a = pdf_spec_file('sample_a')
      file_b = pdf_spec_file('sample_b')
      allow(Identikal::Compare).to receive(:text_compare).and_call_original
      expect(Identikal::Compare).to receive(:text_compare)
      result = Identikal.files_same?(file_a, file_b, compare_method: :text)
      expect(result).to eq(true)
    end

    it 'should immediately return false if page counts are different' do
      file_a = pdf_spec_file('sample_a')
      file_b = pdf_spec_file('sample_c_extra_page')
      allow(Identikal::Compare).to receive(:text_compare).and_call_original
      expect(Identikal::Compare).not_to receive(:text_compare)
      result = Identikal.files_same?(file_a, file_b, compare_method: :text)
      expect(result).to eq(false)
    end
  end

  def pdf_spec_file(base)
    base_path = File.expand_path(File.join(__dir__) + '/data')
    File.join(base_path, "#{base}.pdf")
  end
end
