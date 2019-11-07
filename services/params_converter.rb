class ParamsConverter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def attributes
    {
      hours: hours_left,
      visits: visits_left,
      visited: visited?,
      destroyable: destroyable?
    }
  end

  def hours_left
    params['hours']
  end

  def visits_left
    params['visits']
  end

  def destroyable?
    params['type'] == 'after_hour'
  end

  def visited?
    params['type'] == 'after_visit'
  end
end
