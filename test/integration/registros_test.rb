require "test_helper"

class RegistrosTest < ActionDispatch::IntegrationTest
  setup do
    @registro = Registro.create!(
      nombre: "Ana López",
      correo: "ana@example.com",
      telefono: "5551234567",
      observaciones: "Contacto principal"
    )
  end

  test "shows all records and links to their details" do
    get registros_path

    assert_response :success
    assert_select "h1", "Registros"
    assert_select "a[href=?]", registro_path(@registro), text: "Ana López"
  end

  test "shows an individual record" do
    get registro_path(@registro)

    assert_response :success
    assert_select "h1", "Ana López"
    assert_select "dd", "ana@example.com"
    assert_select "dd", "5551234567"
  end

  test "creates a record" do
    assert_difference("Registro.count", 1) do
      post registros_path, params: {
        registro: { nombre: "Luis Pérez", correo: "luis@example.com", telefono: "", observaciones: "" }
      }
    end

    assert_redirected_to registro_path(Registro.order(:id).last)
  end

  test "rejects a record with an invalid email" do
    assert_no_difference("Registro.count") do
      post registros_path, params: {
        registro: { nombre: "Luis Pérez", correo: "no-es-correo" }
      }
    end

    assert_response :unprocessable_entity
    assert_select ".form-errors"
  end

  test "updates a record" do
    patch registro_path(@registro), params: {
      registro: { nombre: "Ana García", correo: "ana.garcia@example.com" }
    }

    assert_redirected_to registro_path(@registro)
    assert_equal "Ana García", @registro.reload.nombre
  end

  test "deletes a record" do
    assert_difference("Registro.count", -1) do
      delete registro_path(@registro)
    end

    assert_redirected_to registros_path
  end
end
