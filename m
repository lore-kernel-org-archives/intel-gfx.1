Return-Path: <SRS0=nd+/=JY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215A1C43460
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 22:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6C2611ED
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Apr 2021 22:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF6C2611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB246E9FF;
	Tue, 27 Apr 2021 22:50:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3B96EA00
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Apr 2021 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619563807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cO8rq0W/UXy84srQ0IqQ4LM9BXhfScB/i6+15e8JVlQ=;
 b=AZsCSvHbVfhdblRv1aYTL/oXHv9stfJvprEipEUH5K923u/0igJ8H2fA/kaQANOBYSv8OH
 hFCZYy4DGoCQZdOUoAniIZWncASM6fGAIsqI6YXM/MHj4nPAbQf4unBNH1Ckm6B/Iuo1SE
 ihyA2c7K7sgVtcfBGBfCWb7LMvaA5XA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-CSLUtTQ9PMOJSlhk6jA_JQ-1; Tue, 27 Apr 2021 18:50:03 -0400
X-MC-Unique: CSLUtTQ9PMOJSlhk6jA_JQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19B9A803620;
 Tue, 27 Apr 2021 22:49:59 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1845D5D9F2;
 Tue, 27 Apr 2021 22:49:57 +0000 (UTC)
Date: Tue, 27 Apr 2021 16:49:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <20210427164956.750aea67@redhat.com>
In-Reply-To: <20210427222026.GL1370958@nvidia.com>
References: <0-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com>
 <20210427153042.103e12ab@redhat.com>
 <20210427222026.GL1370958@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: Re: [Intel-gfx] [PATCH v2 00/13] Remove vfio_mdev.c,
 mdev_parent_ops and more
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 27 Apr 2021 19:20:26 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Apr 27, 2021 at 03:30:42PM -0600, Alex Williamson wrote:
>  
> > It'd be really helpful if you could consistently copy at least one
> > list, preferably one monitored by patchwork, for an entire series.  The
> > kvm list is missing patches 06 and 08.  I can find the latter hopping
> > over to the intel-gfx or dri-devel projects as I did for the last
> > series, but 06 only copied linux-s390, where I need to use lore and
> > can't find a patchwork.  Thanks,  
> 
> Oh wow, that is not intentional, sorry! Thanks for pointing it out
> 
> I didn't notice this was happening, basically a side effect of having
> so many different people and lists to get on this series - kvm should
> have been CC on them all, I fixed it up going forward.
> 
> FWIW you may be interested in b4 if you haven't seen it before, it is
> a good alternative if there isn't an offical patchworks.

I'm sold!  Thanks,

Alex

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
