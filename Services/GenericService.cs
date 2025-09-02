using System.Linq.Expressions;
using TotecoApi.Repositories;

namespace TotecoApi.Services;

public class GenericService<T> : IGenericService<T> where T : class
{
    private readonly IGenericRepository<T> _repository;

    public GenericService(IGenericRepository<T> repository)
    {
        _repository = repository;
    }

    public async Task<List<T>> GetAllAsync() => await _repository.GetAllAsync();

    public async Task<T?> GetByIdAsync(int id) => await _repository.GetByIdAsync(id);

    public async Task<T> CreateAsync(T entity)
    {
        await _repository.AddAsync(entity);
        return entity;
    }
    public async Task<T?> UpdateAsync(int id, T entity)
    {
        var existing = await _repository.GetByIdAsync(id);
        if (existing == null)
            return null;
        await _repository.UpdateAsync(entity);
        return entity;
    }

    public async Task<bool> DeleteAsync(int id)
    {
        var existing = await _repository.GetByIdAsync(id);
        if (existing == null)
            return false;
        await _repository.DeleteAsync(id);
        return true;
    }

    public async Task<List<T>> FindAsync(Expression<Func<T, bool>> predicate) => await _repository.FindAsync(predicate);
}
