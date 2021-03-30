Return-Path: <SRS0=tdmG=I4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA709C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Mar 2021 16:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C2B4619C8
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Mar 2021 16:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C2B4619C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1699E6E945;
	Tue, 30 Mar 2021 16:29:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B406E942
 for <intel-gfx@lists.freedesktop.org>; Tue, 30 Mar 2021 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617121783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0X96PA+DBZ/FhqBuRCr2t87uXqh8cUcVTzIQTqfSHwc=;
 b=bnegaAxFwZ0JfkWRCWt1ZiXvYhQCUN4RUTPRWeBvDdTAs2HVW/kfYn3LTv6g2jttsKGnxp
 XEMHgWCf/ohiR202a0jSaxzwr0AqeulWg5BmFCor1PsU2Rga2fGlVzjv7oZ41bU1Onclbd
 65KN5zUyMfP7JWtpse++0Gh2mxBz5cU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-KoqYsyN8MU6DFLwHUbRABg-1; Tue, 30 Mar 2021 12:29:38 -0400
X-MC-Unique: KoqYsyN8MU6DFLwHUbRABg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF663185305F;
 Tue, 30 Mar 2021 16:29:35 +0000 (UTC)
Received: from gondolin (ovpn-113-155.ams2.redhat.com [10.36.113.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5F019CB2;
 Tue, 30 Mar 2021 16:29:25 +0000 (UTC)
Date: Tue, 30 Mar 2021 18:29:23 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <20210330182923.74255269.cohuck@redhat.com>
In-Reply-To: <17-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <17-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: Re: [Intel-gfx] [PATCH 17/18] vfio/mdev: Remove kobj from
 mdev_parent_ops->create()
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, "Raj,
 Ashok" <ashok.raj@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, 23 Mar 2021 14:55:34 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> The kobj here is a type-erased version of mdev_type, which is already
> stored in the struct mdev_device being passed in. It was only ever used to
> compute the type_group_id, which is now extracted directly from the mdev.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c  | 2 +-
>  drivers/s390/cio/vfio_ccw_ops.c   | 2 +-
>  drivers/s390/crypto/vfio_ap_ops.c | 2 +-
>  drivers/vfio/mdev/mdev_core.c     | 2 +-
>  include/linux/mdev.h              | 3 +--
>  samples/vfio-mdev/mbochs.c        | 2 +-
>  samples/vfio-mdev/mdpy.c          | 2 +-
>  samples/vfio-mdev/mtty.c          | 2 +-
>  8 files changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
