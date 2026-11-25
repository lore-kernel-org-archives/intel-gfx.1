Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54F1606A6BF
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 19:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o0fjg03K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2F810FF48;
	Wed, 25 Nov 2026 19:24:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EE910FF54
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2026 19:24:16 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-8b3577deeb0so2858018b3a.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2026 11:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795634656; x=1796239456;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=N55gjPKFtoyQEkpZ+mulBFdiGvAn3buEDUMJWwRWBLA=;
 b=o0fjg03K99xbeglX8vH1Gk0O2zFJETttzyb/RmXWAYYAfkY6TFW29W79BEPeJkvCc7
 f2p+oMFidfUQijGKPrra0LGlteoLxGjG+XOzb0bxkH4fE9yv7HKPStIrLVPe3opilhp7
 cygLxqvJc1kQfH6Mj/Em/stQGJBmm+kLcnSBUNWrQ3MSnJtoYZ4du+VektMEZRagjqkN
 HG3L9CgJVpQEmZ6PXtXuUIRUrGEB8dlhiZHzM14M3xa2+x3ds1GoIDIsY8qlQVlFq0WQ
 N+MyCsIqB7kvO7w1T6UcqE2Qti22w10Usm4F4y6BDFJHs+GaKoaNAk8dIfThEE9KxC53
 Q//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795634656; x=1796239456;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N55gjPKFtoyQEkpZ+mulBFdiGvAn3buEDUMJWwRWBLA=;
 b=Go4DGkc6PGtFB/daCS7yjTgQXe4nPO5ha3oAHRQw3XTVamUVmFgqf8RyQVETYnSvI/
 iINqkZSkaNo4T4pnLX8G66EXDmTOj8e4iWzBKw2Fy475bJouC6Gdk2nkjo+irAN5dJle
 eONvwCKKzlQNx8IL2v73kMnTg5/+tUoUtakiQy6nL25li/MMnPaJpaEMsb1LUrFwsVID
 IDjK9Q/bhn8sj6BW4JSNK3M8ccQSJ47fyKWFxb//L/yv1FDQ+9OPUyzcdkjunjlMY67m
 70U5hS3HXY0NXBDfSNmwJnCOLSkVpd4PqYSRGvvm4FvZ3Y81DOjfjdvghPR2IDSFyZI3
 KLNw==
X-Forwarded-Encrypted: i=1;
 AL+hErFGCcYPtCY9OCvmhfG74TSSxB9yaR+JCNk4WWERrqbAbdBM0HGcmhbdHmItDAhqIBY/pII+38+aUZ8=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/MLfL8o2F12JlVM9JxT+K0J4BxOXtHtZhA9sozrqv4MOXuMYyS
 /NzvdhwHoTPMYzXbNW2GDnk3yP2t9Cq3fccJg4BVhwtkuzcnrI+r3BTehZdyRrDEjg==
X-Gm-Gg: AZFdTZeiA/AMpIFHvqPn+Ei/6vQq5Toov2aIZSkDGysgYjxmNWhdZ8E3c+B6WjRVQ9L
 SysBAmzz1CiEiNN54oqIYgx2HtUges3H95swEUjpHDl/OqqF5yEkaFqMtEiw2npwaCn4q4VR+wB
 vMsQblVLIUKJh6Hi1JOzcpajxnlT2D9eIplp/UkjEVCKVQIMMaJu03rhXh82gLWhzTk9YJR4zsB
 4j1dgUzw9YMg6A2au9p31ntjCzjTjdT5y53JCQNvldUOxe7dN2kWFI3K7AnxXUuiEen55VqrLSO
 6Y7KpyH5SzCqgdHu0bZBDCYOi6tLnmqvNq0uJk5u3r5+NK5W0RPbN+4XEvCluk8YQdbZ3jjS1jU
 nUZaU9SJ8y3zACca1xwclH09yD/REpAWJQCw1MbA07kw3BvDGdmdbLewCu4F1F//zbt7qs643cV
 ORURE7I+pHGk7QcU46tT99Y4gCjFkfYqnB6GToWGQYS6lEBi2bAIO+4Df3UKDYdx69fCOKoHVLH
 8mDtEchg0UHhJ0CMMMwF2fIftKjncueUkCMWVJxyQHOujP9TS87QzOh1HmtT0lbXAfz8nDk5n8X
 Xfa5QNSOOctvhQAP10N1uReior2Ri+5I01rfpqJCDySBnWti6WL/ofwQQ3MR6YE4N0pC4RYeBIe
 rTACOX92woUeCJgQbqFjVlNbRFkBd6MOzQz/fsn1oAPUfNWz217uGKmf/noCkXruhSPxFA290Mz
 ya/30rgjJ2wA==
X-Received: by 2002:a05:6a00:a908:b0:886:773d:a6a with SMTP id
 d2e1a72fcca58-8c87c199463mr15925448b3a.28.1795634654761; 
 Wed, 25 Nov 2026 11:24:14 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com.
 [35.197.126.196]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8c87077bc47sm9717494b3a.6.2026.11.25.11.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 11:24:13 -0800 (PST)
Date: Wed, 25 Nov 2026 11:24:10 -0800
From: Benson Leung <bleung@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, linux-mm@kvack.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowangio@gmail.com>, David Heidelberg <david@ixit.cz>,
 oe-linux-nfc@lists.linux.dev, Chas Williams <3chas3@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 MPT-FusionLinux.pdl@broadcom.com,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 linux-mtd@lists.infradead.org, Neill Kapron <nkapron@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Hans de Goede <hansg@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 devel@lists.orangefs.org, Paulo Alcantara <pc@manguebit.org>,
 Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 11/12] docs: ioctl-number: update platform entries
Message-ID: <awc12oWB5WDJi8XZ@google.com>
References: <20261125061340.3402300-1-rdunlap@infradead.org>
 <20261125061340.3402300-12-rdunlap@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Kk3dCghKBQNrocaf"
Content-Disposition: inline
In-Reply-To: <20261125061340.3402300-12-rdunlap@infradead.org>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--Kk3dCghKBQNrocaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:13:38PM -0800, Randy Dunlap wrote:
> Update the list of platform/ files where ioctls are defined and update
> the ranges of function numbers that are used.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org> # cros_ec

For cros_ec as well:

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> v2: no change
> v3: rebase
>=20
> [Since having multiple maintainers trying to merge these would
> cause some conflicts, it would be more manageable for Jon to
> take all of these through the docs-next tree.]
>=20
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
>=20
>  Documentation/userspace-api/ioctl/ioctl-number.rst |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> --- linux-next-20261123.orig/Documentation/userspace-api/ioctl/ioctl-numb=
er.rst
> +++ linux-next-20261123/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -434,6 +434,7 @@ Code  Seq#    Include File
>  0xBA  00-0F  uapi/linux/liveupdate.h                                   P=
asha Tatashin
>                                                                         <=
mailto:pasha.tatashin@soleen.com>
>  0xC0  00-0F  linux/usb/iowarrior.h
> +0xC4  00-1F  platform/raspberrypi/vchiq-interface/vchiq_ioctl.h
>  0xCA  00-0F  uapi/misc/cxl.h                                           D=
ead since 6.15
>  0xCA  10-2F  uapi/misc/ocxl.h
>  0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                                D=
ead since 6.15
> @@ -446,7 +447,7 @@ Code  Seq#    Include File
>  0xDD  00-3F                                                            Z=
FCP device driver see drivers/s390/scsi/
>                                                                         <=
mailto:aherrman@de.ibm.com>
>  0xE5  00-3F  linux/fuse.h
> -0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     C=
hromeOS EC driver
> +0xEC  00-02  linux/platform_data/cros_ec_chardev.h                     C=
hromeOS EC driver
>  0xEE  00-09  uapi/linux/pfrut.h                                        P=
latform Firmware Runtime Update and Telemetry
>  0xEF  00-0F  uapi/linux/ntfs.h                                         N=
TFS
>  0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       s=
isfb

--Kk3dCghKBQNrocaf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCawc12gAKCRBzbaomhzOw
wuvSAP9FFr45oXAv5Psc3n5xsSYyPFouusI/XwRnWy3tYxQspAD+KIeOTWQfcOeC
TWeqyAANog5rg68r7xNPxeH8I/R6xAQ=
=Fk2v
-----END PGP SIGNATURE-----

--Kk3dCghKBQNrocaf--
