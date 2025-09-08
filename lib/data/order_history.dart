import 'menu_data.dart';
import 'cart.dart'; // Para acessar CartItem

// Cada item no histórico mantém quantidade
class OrderItem {
  final MenuItem item;
  int quantity;

  OrderItem({required this.item, required this.quantity});
}

// Lista global do histórico de pedidos
List<OrderItem> orderHistory = [];

// Função para adicionar itens do carrinho ao histórico
void addOrderToHistory(List<CartItem> cartItems) {
  for (var c in cartItems) {
    try {
      // Tenta encontrar item existente
      final existing = orderHistory.firstWhere((o) => o.item.id == c.item.id);
      existing.quantity += c.quantity;
    } catch (e) {
      // Se não encontrar, adiciona novo item
      orderHistory.add(OrderItem(item: c.item, quantity: c.quantity));
    }
  }
}
