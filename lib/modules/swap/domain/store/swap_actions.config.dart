part of swap_domain_module;

class SwapActionLoadConfig extends _BaseAction {
  @override
  Future<AppState?> reduce() async {
    final config = await SwapRepository().getConfig();
    return store.state.rebuild(
      (a) => a.swapState.config = config?.toBuilder(),
    );
  }

  @override
  void after() {
    super.after();
    dispatch(SwapActionLoadConfigAfter());
  }

  @override
  Object? wrapError(dynamic error) {
    return error;
  }
}

class SwapActionLoadConfigAfter extends _BaseAction {
  @override
  AppState? reduce() {
    final isError = swapConfig.tradePairs == null ||
        (swapConfig.tradePairs?.isEmpty ?? true);

    return store.state.rebuild(
      (a) => a.swapState.configState =
          isError ? ConfigState.error.index : ConfigState.success.index,
    );
  }
}
