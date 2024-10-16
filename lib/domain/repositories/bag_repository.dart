import 'package:bag_finder_frontend/domain/entity/bag_entity.dart';
import 'package:bag_finder_frontend/domain/enums/bag_status_enum.dart';

abstract class IBagRepository {
  // Adicionar uma nova mala (bag)
  Future<void> addBag(BagEntity bag);

  // Buscar uma mala (bag) pelo ID
  Future<BagEntity?> getBagById(String id);

  // Atualizar as informações de uma mala (bag)
  Future<void> updateBag(BagEntity bag);

  // Remover uma mala (bag) pelo ID
  Future<void> deleteBag(String id);

  // Buscar todas as malas de um usuário
  Future<List<BagEntity>> getBagsByUserId(String userId);

  // Atualizar o status de uma mala
  Future<void> updateBagStatus(String bagId, BagStatusEnum status);

  // Buscar todas as malas com um determinado status
  Future<List<BagEntity>> getBagsByStatus(BagStatusEnum status);
}
