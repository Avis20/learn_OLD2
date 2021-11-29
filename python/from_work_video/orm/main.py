from sqlalchemy.orm import joinedload

from models import Session, User, Post, Tag


def create_users():
    session = Session()

    admin = User(name='admin', is_staff=True)
    print("перед insert =", admin)

    guest = User(name='guest', is_staff=False)
    print("перед insert =", guest)

    session.add(admin)
    session.add(guest)
    session.commit()
    print("после insert =", admin)
    print("после insert =", guest)

    session.close()


def create_posts():
    session = Session()

    guest = session.query(User).filter_by(name='guest').one()
    print("---> guest posts before", guest.posts)

    post1 = Post(title="Django post", user_id=guest.id)
    post2 = Post(title="Flask post", user=guest)
    session.add(post1)
    session.add(post2)
    session.commit()

    print(post1)
    print(post2)
    print("---> guest posts after", guest.posts)

    session.close()


def create_tags():
    session = Session()

    tag1 = Tag(name="django")
    tag2 = Tag(name="flask")
    tag3 = Tag(name="news")

    session.add(tag1)
    session.add(tag2)
    session.add(tag3)

    session.commit()
    session.close()


def create_relate_posts_and_tags():
    session = Session()

    q_tag = session.query(Tag)
    tag_django: Tag = q_tag.filter_by(name="django").one()
    tag_flask: Tag = q_tag.filter_by(name="flask").one()
    tag_news: Tag = q_tag.filter_by(name="news").one()
    print("\n")
    print(tag_django, tag_flask)
    print(tag_django.posts)
    print("\n")
    q_post = session.query(Post)
    post_django: Post = q_post.filter(Post.title.ilike("django%")).first()
    post_flask: Post = q_post.filter(Post.title.ilike("flask%")).first()

    post_django.tags.append(tag_django)
    post_flask.tags.append(tag_flask)
    post_django.tags.append(tag_news)
    post_flask.tags.append(tag_news)

    print("\n")
    print(post_django, post_flask)
    print(tag_django.posts)
    print("\n")

    session.commit()
    session.close()

def remove_tag():
    session = Session()

    post_django = session.query(
        Post
    ).filter(
        Post.title.ilike("django%")
    ).options(
        joinedload(Post.tags)
    ).first()

    print("\n")
    print(post_django)
    print("\n Before delete")
    print(post_django.tags)
    print("\n")

    for tag in post_django.tags:
        if tag.name == "news":
            post_django.tags.remove(tag)
            break

    print("\n After delete")
    print(post_django.tags)
    print("\n")

    session.commit()
    session.close()

if __name__ == '__main__':
    # create_users()
    # create_posts()
    # create_tags()
    create_relate_posts_and_tags()
    # remove_tag()