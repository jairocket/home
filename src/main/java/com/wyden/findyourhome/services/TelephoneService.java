package com.wyden.findyourhome.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyden.findyourhome.dto.UpdateTelephoneDTO;
import com.wyden.findyourhome.entities.Telephone;
import com.wyden.findyourhome.exceptions.ResourceNotFoundException;
import com.wyden.findyourhome.repositories.TelephoneRepository;

import java.util.List;


@Service
public class TelephoneService {

    @Autowired
    private TelephoneRepository repository;

    public Telephone create(Telephone newTelephone) {
        return repository.save(newTelephone);
    }

    public List<Telephone> saveAll(List<Telephone> telephones) {return repository.saveAll(telephones);}

    public Telephone update(UpdateTelephoneDTO newTelephone) {
        Telephone telephone = repository.findById(newTelephone.getId()).orElseThrow(() -> new ResourceNotFoundException(
                "Não foi possível atualizar este recurso. Recurso não encontrado."));

        telephone.setMainNumber(newTelephone.getMainNumber());
        telephone.setNumber(newTelephone.getNumber());
        return repository.save(telephone);
    }

    public void delete(Long id) {

        repository.deleteById(id);

    }

}
