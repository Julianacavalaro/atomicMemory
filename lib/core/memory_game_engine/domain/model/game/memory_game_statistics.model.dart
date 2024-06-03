abstract class MemoryGameStatistics {
  final int numberOfSuccess;
  final int numberOfFailure;

  const MemoryGameStatistics({
    required this.numberOfSuccess,
    required this.numberOfFailure,
  });

  MemoryGameStatistics copyWith(
      {final int? numberOfSuccess, final int? numberOfFailure});
}

class MemoryGameStatisticsImpl extends MemoryGameStatistics {
  const MemoryGameStatisticsImpl(
      {super.numberOfSuccess = 0, super.numberOfFailure = 0});

  @override
  MemoryGameStatistics copyWith({int? numberOfSuccess, int? numberOfFailure}) =>
      MemoryGameStatisticsImpl(
        numberOfSuccess: numberOfSuccess ?? this.numberOfSuccess,
        numberOfFailure: numberOfFailure ?? this.numberOfFailure,
      );
}
