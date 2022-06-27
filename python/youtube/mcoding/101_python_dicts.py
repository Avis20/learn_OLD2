
from dataclasses import dataclass

def combined_dict_example():
    @dataclass
    class ChannelData:
        id: str
        name: str
        sub_count: int

    channels = (
        ChannelData(id="UCaiL2GDNpLYH6Wokkk1VNcg", name="mCoding", sub_count=122_000),
        ChannelData(id="UC7_gcs09iThXybpVgjHZ_7g", name="PBS Space Time", sub_count=2_630_000),
        ChannelData(id="UCxHAlbZQNFU2LgEtiqd2Maw", name="Cᐩᐩ Weekly With Jason Turner", sub_count=85_000),
    )

    data = {channel.id: channel for channel in channels}
    
    for c_id, item in data.items():
        print(
            f"{item.name} has {item.sub_count} subscribers! "
            f"Watch here: https://youtube.com/channel/{c_id}"
        )


def separate_dicts_example():
    # ID канала на youtube => название
    names = {
        "UCaiL2GDNpLYH6Wokkk1VNcg": "mCoding",
        "UC7_gcs09iThXybpVgjHZ_7g": "PBS Space Time",
        "UCxHAlbZQNFU2LgEtiqd2Maw": "Cᐩᐩ Weekly With Jason Turner",
    }
    # ID канала на youtube => кол-во подписчиков
    sub_counts = {
        "UCaiL2GDNpLYH6Wokkk1VNcg": 122_000,
        "UC7_gcs09iThXybpVgjHZ_7g": 2_630_000,
        "UCxHAlbZQNFU2LgEtiqd2Maw": 85_000,
    }
    # Задача вывести название, кол-во подписчиков и ссылку на канал
    for c_id in names:
        name = names[c_id]
        sub_count = sub_counts[c_id]
        print(
            f"{name} has {sub_count} subscribers! "
            f"Watch here: https://youtube.com/channel/{c_id}"
        )

if __name__ == '__main__':
    # Решение в лоб
    separate_dicts_example()
    # >>> mCoding has 122000 subscribers! Watch here: https://youtube.com/channel/UCaiL2GDNpLYH6Wokkk1VNcg
    # >>> PBS Space Time has 2630000 subscribers! Watch here: https://youtube.com/channel/UC7_gcs09iThXybpVgjHZ_7g
    # >>> Cᐩᐩ Weekly With Jason Turner has 85000 subscribers! Watch here: https://youtube.com/channel/UCxHAlbZQNFU2LgEtiqd2Maw

    combined_dict_example()
    # >>> mCoding has 122000 subscribers! Watch here: https://youtube.com/channel/UCaiL2GDNpLYH6Wokkk1VNcg
    # >>> PBS Space Time has 2630000 subscribers! Watch here: https://youtube.com/channel/UC7_gcs09iThXybpVgjHZ_7g
    # >>> Cᐩᐩ Weekly With Jason Turner has 85000 subscribers! Watch here: https://youtube.com/channel/UCxHAlbZQNFU2LgEtiqd2Maw