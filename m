Return-Path: <SRS0=QorL=KJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33650C433B4
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 05:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FDD61440
	for <intel-gfx@archiver.kernel.org>; Fri, 14 May 2021 05:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FDD61440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED3E6EE09;
	Fri, 14 May 2021 05:49:30 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090866EE09
 for <intel-gfx@lists.freedesktop.org>; Fri, 14 May 2021 05:49:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D683967373; Fri, 14 May 2021 07:49:23 +0200 (CEST)
Date: Fri, 14 May 2021 07:49:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20210514054923.GA5323@lst.de>
References: <20210513232841.147989-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513232841.147989-1-jose.souza@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix a possible use of
 uninitialized variable in remap_io_sg()
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
Cc: intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, May 13, 2021 at 04:28:41PM -0700, Jos=E9 Roberto de Souza wrote:
> If the do while loop breaks in 'if (!sg_dma_len(sgl))' in the first
> iteration, err is uninitialized causing a wrong call to zap_vma_ptes().

But scatterlist must have at least one valid segment.  So while the
patch looks ok, please clearly mark that this is a false positive from
the static checker in the commit log.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
