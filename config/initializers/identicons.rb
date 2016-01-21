class Identicon

  def generate_image
    png_image = ChunkyPNG::Image.new(@image_size,
                                     @image_size,
                                     ChunkyPNG::Color::TRANSPARENT
                                    )
    @image = ChunkyPNG::Image.new(@size,
                                  @size,
                                  ChunkyPNG::Color::TRANSPARENT
                                 )
    @square_array.each_key do |line_key|
      line_value = @square_array[line_key]
      line_value.each_index do |col_key|
        col_value = line_value[col_key]
        if col_value
          png_image.rect(
            col_key * @pixel_ratio,
            line_key * @pixel_ratio,
            (col_key + 1) * @pixel_ratio,
            (line_key + 1) * @pixel_ratio,
            ChunkyPNG::Color::TRANSPARENT,
            ChunkyPNG::Color.rgba(0,0,0,128)
            #ChunkyPNG::Color("#000000")
          )
        end
      end
    end
    @image.compose!(png_image, @pixel_ratio / 2, @pixel_ratio / 2)
  end

end
