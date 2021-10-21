Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5E5C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 14:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D8360FE8
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 14:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9D8360FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F27C6EC8D;
	Thu, 21 Oct 2021 14:28:59 +0000 (UTC)
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D85A6EC8D;
 Thu, 21 Oct 2021 14:28:57 +0000 (UTC)
Date: Thu, 21 Oct 2021 14:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634826535;
 bh=XhCHjy4D/VoaIqOFwU/L+rZZ/vqAoKZ2ejoeJJT2rNA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=u/6sFNgLLWqLY6g3u/dwNUO5iVIWPCFS9/3O5Yw8JSmbXqB8Jcuin/duG+eOt6zpR
 2lvGCzAPY6eHuFRj+TVg6ijlD18fjfNKn6i9TrELbzL1Lda2/2ZRebBqm0dX/ISb9o
 EaaGXs3/1VZ6hrNn2XFwwmAIRlAGmfaD6OEwWaPDoJdJ11HX4TTR+WoHxK1CqPRBnO
 WvdeH1U4+ugW0Ht5Shch8+eF575+JTx9TtpFmM12zSc+qLPkcvbFjaqO/HKyy5aeka
 FqjRtNWepjSvqb6mEHoQDUlxZfRIKYan+/2daWcrJT6+uxD8bVhuX11aje8K5MPqoz
 15QH3WwSJmAQg==
To: Ramalingam C <ramalingam.c@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 CQ Tang <cq.tang@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <0TCwIaJ_y0G_dlblGhM5TI_ssamrIgqkNkEReoQRgtJ74Lo3UFL3Q-1vicXKBwRwgtcEBjCaTIJDZAO53sJhFl8gqPHhwqYa3v4JoUWgZWw=@emersion.fr>
In-Reply-To: <20211021142627.31058-15-ramalingam.c@intel.com>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
 <20211021142627.31058-15-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v2 14/17] uapi/drm/dg2: Format modifier for
 DG2 unified compression and clear color
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

For the include/uapi/drm/drm_fourcc.h changes:

Acked-by: Simon Ser <contact@emersion.fr>
