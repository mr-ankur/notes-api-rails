require 'swagger_helper'

describe 'Notes API' do

  path '/api/v1/notes' do

    post 'Creates a note' do
      tags 'Notes'
      consumes 'application/json', 'application/xml'
      parameter name: :note, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          photo_url: { type: :string },
          status: { type: :string }
        },
        required: [ 'name', 'status' ]
      }

      response '201', 'note created' do
        let(:note) { { name: 'Dodo', status: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:note) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/notes/{id}' do

    get 'Retrieves a note' do
      tags 'Notes'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            photo_url: { type: :string },
            status: { type: :string }
          },
          required: [ 'id', 'name', 'status' ]

        let(:id) { Note.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
        run_test!
      end

      response '404', 'note not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
