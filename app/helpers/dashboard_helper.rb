module DashboardHelper

  SRMS = %w(
    #FFFFFF
    #F3F993
    #F5F75C
    #F6F513
    #EAE615
    #E0D01B
    #D5BC26
    #CDAA37
    #C1963C
    #BE8C3A
    #BE823A
    #C17A37
    #BC6733
    #B26033
    #A85839
    #985336
    #BF7138
    #8D4C32
    #7C452D
    #6B3A1E
    #5D341A
    #4E2A0C
    #4A2727
    #361F1B
    #261716
    #231716
    #19100F
    #16100F
    #120D0C
    #100B0A
    #050B0A)

  FONT_COLORS = %w(
    #000000
    #000000
    #000000
    #000000
    #000000
    #000000
    #000000
    #000000
    #000000
    #000000
    #000000
    #000000
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    #FFFFFF
    )

  def color_for_srm(srm)
    position = srm < 0 ? 1 : [30, srm.to_i].min
    "background-color:#{SRMS[position]};color:#{FONT_COLORS[position]}"
  end
end
