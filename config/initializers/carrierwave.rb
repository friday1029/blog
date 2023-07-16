# encoding: utf-8
# @TODO 參考改寫：https://github.com/carrierwaveuploader/carrierwave/blob/master/lib/carrierwave/processing/vips.rb
module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end

    def colorspace(cs)
      manipulate! do |img|
        img.combine_options do |c|
          case cs.to_sym
          when :rgb
            c.colorspace "sRGB"
          when :cmyk
            c.colorspace "CMYK"
          end
        end
        img = yield(img) if block_given?
        img
      end
    end

    def strip
      manipulate! do |img|
        img.strip
        img = yield(img) if block_given?
        img
      end
    end

    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.hex(3))
    end

  end
end
