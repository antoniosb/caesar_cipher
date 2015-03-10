require_relative 'caesar_cipher'

describe CaesarCipher do
  describe '#encrypt' do
    let(:message) { "What a String!" }
    let(:factor) { 5 }

    it 'receives a message and a shift factor as parameters' do
      expect(CaesarCipher).to receive(:encrypt).with(message, factor)
      CaesarCipher.encrypt message, factor
    end
    it 'raises error for unknown parameters' do
      expect { CaesarCipher.encrypt message }.to raise_error ArgumentError
      expect { CaesarCipher.encrypt nil, factor }.to raise_error ArgumentError
      expect { CaesarCipher.encrypt message, nil}. to raise_error ArgumentError
      expect { CaesarCipher.encrypt factor, message }.to raise_error ArgumentError
      expect { CaesarCipher.encrypt [message], factor }.to raise_error ArgumentError
      # (...)
    end

    it 'shift the message letters by the given factor' do
      expect(CaesarCipher.encrypt message, factor).to eq "Bmfy f Xywnsl!"
    end

    it 'ignores non alphabetical characters' do
      special_message = "!@#$%&*()_= 45467"
      result = CaesarCipher.encrypt special_message, factor
      expect(result).to eql special_message
    end

    it 'keeps the same case' do
      expect(CaesarCipher.encrypt message.upcase, factor).to eq "BMFY F XYWNSL!"
    end

  end

  describe '#decrypt' do
    let(:message) { "Bmfy f Xywnsl!" }
    let(:factor) { 5 }

    it 'receives a message and a shift factor as parameters' do
      expect(CaesarCipher).to receive(:decrypt).with(message, factor)
      CaesarCipher.decrypt message, factor
    end

    it 'raises error for unknown parameters' do
      expect { CaesarCipher.decrypt message }.to raise_error ArgumentError
      expect { CaesarCipher.decrypt nil, factor }.to raise_error ArgumentError
      expect { CaesarCipher.decrypt message, nil}. to raise_error ArgumentError
      expect { CaesarCipher.decrypt factor, message }.to raise_error ArgumentError
      expect { CaesarCipher.decrypt [message], factor }.to raise_error ArgumentError
    end

    it 'unshift the message letters by the given factor' do
      expect(CaesarCipher.decrypt message, factor).to eq "What a String!"
    end

    it 'ignores non alphabetical characters' do
      special_message = "!@#$%&*()_= 45467"
      result = CaesarCipher.decrypt special_message, factor
      expect(result).to eql special_message
    end

    it 'keeps the same case' do
      expect(CaesarCipher.decrypt message.upcase, factor).to eq "WHAT A STRING!"
    end    
  end

end
