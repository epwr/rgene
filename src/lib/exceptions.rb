



# Allow catching all intentionally thrown errors by having a base error for the
# gem
class RGeneError < StandardError; end

class DirectoryExistsError < RGeneError
  def initialize msg="This directory already exists"
    super
  end
end
