class ClientPdf < Prawn::Document
	Prawn::Font::AFM.hide_m17n_warning = true

    def initialize (record, title)
		super(margin: 50)
		@record = record
		@title = title
		

		bounding_box([000, 700], :width => 500) do
			text @title, size: 15, style: :bold, align: :center
		end

		bounding_box([000, 700], :width => 500, :height => 700) do
			move_down 100
			line_items
		end

	end

	def line_items
		
		table line_item_rows do
			
			row(0).font_style = :bold
			columns(0..2).align = :left
			#column(0).width = 20
			column(0).width = 300
			column(1).width = 200
			self.row_colors = ["DDDDDD", "FFFFFF"]
			self.header = true
			
		end
	end

	def line_item_rows
		
		[["Nome", "Assinatura"]] + 
		@record.map do |rec|
			["#{rec.name.upcase}", ""]
		end
		
	end

end