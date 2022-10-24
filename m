Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DE5FA373E
	for <intel-gfx@archiver.kernel.org>; Mon, 24 Oct 2022 13:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C9D10E704;
	Mon, 24 Oct 2022 13:35:05 +0000 (UTC)
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF4B10E704
 for <intel-gfx@lists.freedesktop.org>; Mon, 24 Oct 2022 13:35:01 +0000 (UTC)
Date: Mon, 24 Oct 2022 13:27:49 +0000
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="RrKx0rux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666618076; x=1666877276;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RrKx0ruxHRJcLCtm+CSNShQm6u3rDTD6xov+cxZPXsajzKiUqiiQGr6JeV3pyRDem
 V3byiWA5/AdYuqlxpboIGy1Aa+Z1O0pOzuy1lgXhYgvOyfdzVnBs41+Q5pn7VLDaPD
 UP/BI9BFabn79mo+7UM3f2qnhuvBOzCbgWhBwb20cL8NYuXSBBP+dWotH4I2jZugve
 F4c9gXDs2QblmnCQSHu0Bil53nsPoERTezmANZ5QAzsA6DGwTwONGWqCTBwRnuK+hB
 ZfOipttLXLiH+OTgR2XXXteNyGkdTtlan+5QXmsc5ag8AekKbramZvN5xWPIw16obN
 rJRf88OleU8SQ==
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <6U_Z5zft-VPLFt24BznLzk9ykK2iHlgLRoMRlosOnPrTBc4k6oUkiaJ6i7ZnV3d4nTMqC8hvE4XiqWpRFFyu_oYxR32h5InKMXFToBH1M8c=@emersion.fr>
In-Reply-To: <5884410682bcbc032de4d3af8562c0b271edaa7f.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
 <5884410682bcbc032de4d3af8562c0b271edaa7f.1666614699.git.jani.nikula@intel.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH v2 15/16] drm/edid: add [CONNECTOR:%d:%s] to
 debug logging
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
