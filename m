Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25853FEFB54
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Feb 2026 13:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E0910EB6A;
	Fri, 27 Feb 2026 13:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DcjIXeLg";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4237510E9D9
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 21:49:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E6AEF4455D
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 21:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A105AC2BCAF
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 21:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772142540;
 bh=LF4bwcYv1+PfMspbbpqO2VzfLK8CTRaCpOj6mQJxZGw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DcjIXeLgrxqUYwwv+2hZCBu8T09MVdaj4sSw8in+d9ikwiv6jPM/YXPBL00H8vz+L
 ThBlz0nE8Lf5ETYcNtggwxUpTaTtpxvJzo6zuFsbRb8XoqlA9Fh9yjWBh0hxolp6uP
 F4RBlPeM6zLgUqIIeXrHHNM23II286EyJloqnQZQDeWWJH6pSFZ/PCtkdKVacnfQjO
 j39CTWgFGDhh9HZ9An7My+BGm7MDURWMkjqHI10HW8SaosV01xNYbdS9uJSRV+fDJ+
 jhAZOaOllUvBy/kqKwJuum3OskFoy2GeMvvV0xHQSbc+35MVaFPFbyqJ1+b6Gwa1RP
 ewnbRhbSJ1htQ==
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-64aea64bf15so1200635d50.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 13:49:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ7TO5RB70fY0MPGxhALBzsQTBUfvtuANOXYTY10D1sfk8+NuNce7z02A3AIcq7oPFJTEXgHARgNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkSNs24xwKNdeLqELEbOdnAs1T4dS23Qlwn/BUReuo4O2jAwzF
 LiRCdnpWurmN7lOuXCZoAac5ORvGXrfROLCqeR8Jv00FxB7ZkhXqNalF3AqdKT3yc1EFbj+mTIo
 bOSW9QgwFHLMy/F4Jpm24kVJG77jFUJiomfv5+89LjQ==
X-Received: by 2002:a53:e8c9:0:b0:64c:a81e:f2b2 with SMTP id
 956f58d0204a3-64cc211f150mr699646d50.27.1772142538704; Thu, 26 Feb 2026
 13:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-2-716868cc2d11@columbia.edu>
In-Reply-To: <20260225-pagevec_cleanup-v2-2-716868cc2d11@columbia.edu>
From: Chris Li <chrisl@kernel.org>
Date: Thu, 26 Feb 2026 13:48:47 -0800
X-Gmail-Original-Message-ID: <CACePvbX5Qm+kQLtCWynvO-2YtoW0mdR+V6rfq=buR6tfR1A9FQ@mail.gmail.com>
X-Gm-Features: AaiRm50fP40RQkljlPLX-PI1NSM3iQnOuQQEi7r5tKbV7kaWVe_vUmPk2uGLYLk
Message-ID: <CACePvbX5Qm+kQLtCWynvO-2YtoW0mdR+V6rfq=buR6tfR1A9FQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fs: Remove unncessary pagevec.h includes
To: Tal Zussman <tz2294@columbia.edu>
Cc: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Kairui Song <kasong@tencent.com>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, 
 Dan Williams <dan.j.williams@intel.com>, Jan Kara <jack@suse.cz>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, 
 "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Paulo Alcantara <pc@manguebit.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, Steve French <sfrench@samba.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, 
 Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, 
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, Brendan Jackman <jackmanb@google.com>,
 Zi Yan <ziy@nvidia.com>, 
 Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-ext4@vger.kernel.org, netfs@lists.linux.dev, linux-nfs@vger.kernel.org, 
 ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, 
 linux-xfs@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 27 Feb 2026 13:41:00 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Feb 25, 2026 at 3:44=E2=80=AFPM Tal Zussman <tz2294@columbia.edu> w=
rote:
>
> Remove unused pagevec.h includes from .c files. These were found with
> the following command:
>
>   grep -rl '#include.*pagevec\.h' --include=3D'*.c' | while read f; do
>         grep -qE 'PAGEVEC_SIZE|folio_batch' "$f" || echo "$f"
>   done
>
> There are probably more removal candidates in .h files, but those are
> more complex to analyze.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Chris Li <chrisl@kernel.org>

Chris
