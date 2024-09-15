import 'package:Cad_Med/services/text/truncateText.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget selectionSection({
  double? width,
  IconData icon = Icons.account_box_outlined,
  String title = "",
  String hintText = "",
  required TextEditingController controller,
  required Function(String?) onChanged,
  required List<String> items, // Lista de Strings
  String? selectedValue, // Valor inicial selecionado
}) {
  // Função para truncar texto com no máximo 30 caracteres

  // Verifica se `items` tem elementos e define o valor selecionado corretamente
  final String? dropdownValue =
      selectedValue != null && items.contains(selectedValue)
          ? selectedValue
          : (items.isNotEmpty ? items.first : null);

  return SizedBox(
    width: width ??
        double.infinity, // Garante que o campo ocupe toda a largura disponível
    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinha o título à esquerda
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(.8)),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: width ??
              double
                  .infinity, // Adapta a largura ao valor fornecido ou preenche a tela
          child: DropdownButtonFormField<String>(
            value: dropdownValue, // Valor inicial da seleção
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(.5)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(.5)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            hint: Text("Selecione $hintText"),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: AutoSizeText(
                  truncateText(
                      value), // Trunca o texto se exceder 30 caracteres
                  maxLines: 1,
                  minFontSize: 12,
                  maxFontSize: 16,
                  overflow: TextOverflow
                      .ellipsis, // Adiciona reticências no texto longo
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Atualiza o valor selecionado
              onChanged(newValue);
            },
            dropdownColor: Colors.white, // Cor do dropdown
            menuMaxHeight: 200.0, // Define a altura máxima do menu suspenso
          ),
        ),
      ],
    ),
  );
}
