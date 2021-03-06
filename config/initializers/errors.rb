# frozen_string_literal: true

class ApplicationError < StandardError; end
class AuthenticationError < ApplicationError; end
class RecordInvalidError < ApplicationError; end
class RecordNotFoundError < ApplicationError; end
