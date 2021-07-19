Return-Path: <SRS0=F6ds=ML=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0722FC07E9B
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 11:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72D760FDB
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Jul 2021 11:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72D760FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5726A6E108;
	Mon, 19 Jul 2021 11:42:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EDC6E108
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Jul 2021 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626694967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QFvbmLxaTL7ZR1JOPuD7J5PG0/Wd11FgMA0Fpfbp4YU=;
 b=HAYwfsC0Y+00Ol+8lPEM6etNBnJlGnDTv5s3voXOvPTwyynuvmWiLCKRtSwYlVVbnEOmUq
 42lFcTwxgmxj2Fn0Ag3v9ZNIoEwD3YNEmOAa8YaVgZCqN711cJMJw1NSkuRV+i85wO7cIJ
 mApLeIOq+w1Lb9QOCN0sjg7eYe1FIA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-_ZipgJfiNrK0MGH1D7bbcA-1; Mon, 19 Jul 2021 07:42:44 -0400
X-MC-Unique: _ZipgJfiNrK0MGH1D7bbcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E555C1023F4F;
 Mon, 19 Jul 2021 11:42:39 +0000 (UTC)
Received: from localhost (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2379719C79;
 Mon, 19 Jul 2021 11:42:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, Tony
 Krowiak <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Jonathan Corbet <corbet@lwn.net>, Daniel Vetter
 <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>, Eric
 Farman <farman@linux.ibm.com>, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
In-Reply-To: <1-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
Organization: Red Hat GmbH
References: <1-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 19 Jul 2021 13:42:29 +0200
Message-ID: <875yx6bkd6.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: Re: [Intel-gfx] [PATCH 01/13] vfio/samples: Remove module get/put
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jul 14 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:

> The patch to move the get/put to core and the patch to convert the samples
> to use vfio_device crossed in a way that this was missed. When both
> patches are together the samples do not need their own get/put.
>
> Fixes: 437e41368c01 ("vfio/mdpy: Convert to use vfio_register_group_dev()")
> Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  samples/vfio-mdev/mbochs.c | 4 ----
>  samples/vfio-mdev/mdpy.c   | 4 ----
>  2 files changed, 8 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
